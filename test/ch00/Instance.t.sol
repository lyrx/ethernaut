// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/ch00/Instance.sol";

contract InstanceTest is Test {
    Instance instance;
    string constant PASSWORD = "secret";

    function setUp() public {
        instance = new Instance(PASSWORD);
    }

    function testInitialInfoNum() public {
        assertEq(instance.infoNum(), 42);
    }

    function testInfoMethods() public {
        assertEq(instance.info(), "You will find what you need in info1().");
        assertEq(instance.info1(), 'Try info2(), but with "hello" as a parameter.');
        assertEq(instance.info2("hello"), "The property infoNum holds the number of the next info method to call.");
        assertEq(instance.info2("wrong"), "Wrong parameter.");
    }

    function testInfo42Method() public {
        assertEq(instance.info42(), "theMethodName is the name of the next method.");
    }

    function testMethod7123949() public {
        assertEq(instance.method7123949(), "If you know the password, submit it to authenticate().");
    }

    function testAuthentication() public {
        instance.authenticate(PASSWORD);
        assertTrue(instance.getCleared());
    }

    function testAuthenticationWrong() public {
        instance.authenticate("wrongpassword");
        assertFalse(instance.getCleared());
    }
}
