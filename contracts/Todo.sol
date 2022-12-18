// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Todo {
    uint256 public taskCount;
    struct Task {
        uint256 id;
        string heading;
        string description;
    }

    Task[] public tasks;

    constructor() {
        taskCount = 0;
    }

    function createTask(string memory head, string memory desc) public {
        tasks.push(Task(taskCount++, head, desc));
    }

    function updateTask(
        uint256 id,
        string memory head,
        string memory desc
    ) public {
        tasks[id].heading = head;
        tasks[id].description = desc;
    }

    function deleteTask(uint256 id) public {
        delete tasks[id];
    }
}
