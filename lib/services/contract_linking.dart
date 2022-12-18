import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

import '../models/task_model.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = dotenv.env['RPC_URL']!;
  final String _wsUrl = dotenv.env['WS_URL']!;
  final String _privatekey = dotenv.env['PRIVATE_KEY']!;
  final String _contractName = "Todo";

  List<Task> tasks = [];
  bool isLoading = true;

  late Web3Client _client;
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late EthPrivateKey _creds;

  ContractLinking() {
    init();
  }

  Future<void> init() async {
    _client = Web3Client(
      _rpcUrl,
      http.Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsUrl).cast<String>();
      },
    );
    await _getABI();
    await _getCredentials();
    await _getDeployedContract();
  }

  Future<void> _getABI() async {
    String abiStringFile =
        await rootBundle.loadString('src/artifacts/$_contractName.json');
    var jsonABI = jsonDecode(abiStringFile);
    _abiCode = ContractAbi.fromJson(jsonEncode(jsonABI['abi']), _contractName);
    _contractAddress =
        EthereumAddress.fromHex(jsonABI["networks"]["5777"]["address"]);
  }

  Future<void> _getCredentials() async {
    _creds = EthPrivateKey.fromHex(_privatekey);
  }

  late DeployedContract _deployedContract;

  late ContractFunction _tasks;
  late ContractFunction _taskCount;
  late ContractFunction _createTask;
  late ContractFunction _deleteTask;

  Future<void> _getDeployedContract() async {
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
    _tasks = _deployedContract.function('tasks');
    _taskCount = _deployedContract.function('taskCount');
    _createTask = _deployedContract.function('createTask');
    _deleteTask = _deployedContract.function('deleteTask');
    await fetchTasks();
  }

  Future<void> fetchTasks() async {
    List totalTaskList = await _client.call(
      contract: _deployedContract,
      function: _taskCount,
      params: [],
    );

    int taskLength = totalTaskList[0].toInt();
    tasks.clear();
    for (var i = 0; i < taskLength; i++) {
      var temp = await _client.call(
          contract: _deployedContract,
          function: _tasks,
          params: [BigInt.from(i)]);
      if (temp[1] != "") {
        tasks.add(
          Task(
            id: temp[0],
            taskTitle: temp[1],
            taskDescription: temp[2],
          ),
        );
      }
    }
    isLoading = false;

    notifyListeners();
  }

  Future<void> createTask(String title, String description) async {
    await _client.sendTransaction(
      _creds,
      Transaction.callContract(
        contract: _deployedContract,
        function: _createTask,
        parameters: [title, description],
      ),
    );
    isLoading = true;
    fetchTasks();
  }

  Future<void> deleteAllTasks() async {
    await _client.sendTransaction(
      _creds,
      Transaction.callContract(
        contract: _deployedContract,
        function: _deleteTask,
        parameters: [BigInt.from(0)],
      ),
    );
    isLoading = true;
    notifyListeners();
    fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await _client.sendTransaction(
      _creds,
      Transaction.callContract(
        contract: _deployedContract,
        function: _deleteTask,
        parameters: [BigInt.from(id)],
      ),
    );
    isLoading = true;
    notifyListeners();
    fetchTasks();
  }
}
