// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol"; //library for testing
import 'src/HelloWorld.sol';

contract HelloWorldTest is Test {
    HelloWorld hello; //instance of the HelloWorld in src
    function setUp() public { //runs before each unit test
      hello = new HelloWorld("Foundry is fast!"); //argument of the constructor (ie greeting)
    }

    function test1() public {
        assertEq(
            hello.greet(),
            "Foundry is fast!"
        );
    }

    function test2() public {
        assertEq(hello.version(), 0);
        hello.updateGreeting("Hello World");  //updates the version
        assertEq(hello.version(), 1); //check if version actually got updated
        assertEq(
            hello.greet(),
            "Hello World"
        );
    }

    // fuzz-test
    function test3(string memory x) public {
        hello.updateGreeting(x);
        assertEq(
            hello.greet(),
            x
        );
    }

    // function test4(uint256 x) public {
    //     uint version=0;
    // }
}