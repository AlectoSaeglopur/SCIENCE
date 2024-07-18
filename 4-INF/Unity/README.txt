
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
  - setup a compilation chain via Make.
  
  


>> fai Make per invocare easy il test!!



// in alternativa al metodo di Ex2 (1 Makefile e multipli build type), si potrebbe anche usare l'approccio di un Makefile per ogni  build type (i.e. uno per sottocartella, in questo caso  src e test) ma meno elegante!


  
  
  //>> TEARDOWN
//This attribute is used inside a TestFixture to provide a common set of functions that are performed after each test method.
//
//TearDown methods may be either static or instance methods and you may define more than one of them in a fixture. Normally, multiple TearDown methods are only defined at different levels of an //inheritance hierarchy, as explained below.
//
//So long as any SetUp method runs without error, the TearDown method is guaranteed to run. For example, it is not guaranteed to run if a SetUp method fails or throws an exception.
//
//
//>> SETUP
//This attribute is used inside a TestFixture to provide a common set of functions that are performed just before each test method is called.
//
//SetUp methods may be either static or instance methods and you may define more than one of them in a fixture. Normally, multiple SetUp methods are only defined at different levels of an //inheritance hierarchy, as explained below.
//
//If a SetUp method fails or throws an exception, the test is not executed and a failure or error is reported.