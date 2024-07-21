
>> 1. SETUP <<

§ To get Unity engine functions:
  - clone "Unity" repository from "ThrowTheSwitch" GitHub website (see https://github.com/ThrowTheSwitch/Unity), e.g. here LR saved within ".\unity_repo\Unity\".

------------------------------------------------------------

>> 2. USAGE <<

§ To setup unit tests on a new project:
  - pull latest changes from Unity RR and then copy the x3 files within ".\unity_repo\Unity\src\" (i.e. "unity.c", "unity.h" and "unity_internals.h") into the "unity_engine" folder of your project [NEVER MODIFY THESE];
  - add the library files (where functions under test are located) within the "func_ut" (or "prj_ut") folder of your project (e.g. "fibonacci.c" and "fibonacci.h");
  - add the testing files (where all test cases are defined) within the "test_list" folder of your project;
  - adjust the "umain.c" file just to invoke the tests (plus the optional definition of 'setup' and 'teardown' functions).

------------------------------------------------------------

>> 3. RUN <<

§ To setup unit tests on a new project:
  - compile manually all files via GCC on shell (e.g. for the 1st example use "cls && gcc main.c test_list\test.c func_ut\fibonacci.c unity_engine\unity.c -o asd && asd";
  - setup a compilation chain via Make (see 2nd example within "ex2_tlc_chain_project\").
  
  ------------------------------------------------------------

>> 4. NOTES <<

§ The "setup" function inside "umain.c" can be used to execute a set of actions just before each test method is called. If a "setup" method fails or throws an exception, the test is not executed and a failure or error is reported.

§ The "teardown" function inside "umain.c" can be used to execute a set of actions after each test method. So long as any "setup" method runs without error, the "teardown" method is guaranteed to run.
