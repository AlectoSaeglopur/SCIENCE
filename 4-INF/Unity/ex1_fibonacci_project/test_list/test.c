/*
 * Library where all test cases are defined (and invoked by main.c).
 */


/** INCLUDES **/

#include <limits.h>
#include "test.h"
#include "..\unity_engine\unity.h"
#include "..\func_ut\fibonacci.h"



/** FUNCTIONS **/

/* Function to check that the 1st element (i.e. [0]) of Fibonacci sequence equals 1 */
void test_1st_element_return_1( void ){
    TEST_ASSERT_EQUAL_INT(1, fibonacci_get_nth_element(0));                                         // unity function to check if the output of the tested function (2nd  argument) matches the expected result (1st argument)
}

/* Function to check that the 2nd element of Fibonacci sequence equals 1 */
void test_2nd_element_return_1( void ){
    TEST_ASSERT_EQUAL_INT(1, fibonacci_get_nth_element(1));
}

/* Function to check that the 3rd element of Fibonacci sequence equals 2 */
void test_3rd_element_return_2( void ){
    TEST_ASSERT_EQUAL_INT(2, fibonacci_get_nth_element(2));
}

/* Function to check all elements of the Fibonacci sequence (up to a maximum degree). */
void test_sequence_section( void ){
    int expected[ ] = {1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144};
    int i;
    for (i = 0; i < ARRAY_LENGTH(expected); i++){
        TEST_ASSERT_EQUAL_INT(expected[i], fibonacci_get_nth_element(i));
    }
}

/* Function to check that the -1st, -3rd, etc elements of Fibonacci sequence equal 0 (meaning are not part of the sequence!) */
void test_negative_indeces_return_0( void ){
    TEST_ASSERT_EQUAL_INT(0, fibonacci_get_nth_element(-1));
    TEST_ASSERT_EQUAL_INT(0, fibonacci_get_nth_element(-3 ));
    TEST_ASSERT_EQUAL_INT(0, fibonacci_get_nth_element(-555));
    TEST_ASSERT_EQUAL_INT(0, fibonacci_get_nth_element(INT_MIN));
}

/* Function to check that over-degree element indeces of Fibonacci sequence equal 0 (meaning are not part of the sequence!) */
void test_overdegree_indeces_return_0( void ){
    const int first_bad_element = FIB_MAX_ELEMENT+1;
    const int last_good_element = first_bad_element-1;
    int last_good_value = fibonacci_get_nth_element(last_good_element);                             // check max degree
    TEST_ASSERT_MESSAGE( last_good_value>1 , "ERROR - this value should not have rolled-over");     // unity function to print the 2nd argument in case the 1st argument condition is false
    TEST_ASSERT_EQUAL_INT(0, fibonacci_get_nth_element(first_bad_element));                         // check max degree+1
    TEST_ASSERT_EQUAL_INT(0, fibonacci_get_nth_element(INT_MAX));                                   // check over-degree
}

/* Function to check that element 0 is not part of Fibonacci sequence. */
void test_value_0_is_not_in_sequence( void ){
    TEST_ASSERT_FALSE( fibonacci_is_element_in_sequence(0));
}

/* Function to check that element 1 is part of Fibonacci sequence. */
void test_value_1_is_in_sequence( void ){
    TEST_ASSERT_TRUE(fibonacci_is_element_in_sequence(1));
}

/* Function to check that element 2 is part of Fibonacci sequence. */
void test_value_2_is_in_sequence(void){
    TEST_ASSERT_TRUE(fibonacci_is_element_in_sequence(2));
}

/* Function to check that element 3 is part of Fibonacci sequence. */
void test_value_3_is_in_sequence( void ){
    TEST_ASSERT_TRUE(fibonacci_is_element_in_sequence(3));
}

/* Function to check that element 4 is not part of Fibonacci sequence. */
void test_value_4_is_not_in_sequence( void ){
    TEST_ASSERT_FALSE(fibonacci_is_element_in_sequence(4));
}

/* Function to check that element 5 is part of Fibonacci sequence. */
void test_value_5_is_in_sequence( void ){
    TEST_ASSERT_TRUE(fibonacci_is_element_in_sequence(5));
}

/* Function to check all numbers from 0 to 144 are correctly recognized as part or not part of Fibonacci sequence. */
void test_values_all_values_are_in_sequence( void ){
    int expected[ ] = {1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144};
    int e = 0;
    int i;
    for (i=0; i <= 144; i++){
        if (expected[e] == i){
            TEST_ASSERT_TRUE(fibonacci_is_element_in_sequence(i));
            e++;
        } else {
            TEST_ASSERT_FALSE(fibonacci_is_element_in_sequence(i));
        }
    }
}

/* Function to check that all negative values are not recognized as part of Fibonacci sequence. */
void test_negative_values_are_not_in_sequence( void ){
    TEST_ASSERT_FALSE( fibonacci_is_element_in_sequence(-1));
    TEST_ASSERT_FALSE( fibonacci_is_element_in_sequence(-18));
    TEST_ASSERT_FALSE( fibonacci_is_element_in_sequence(-999));
    TEST_ASSERT_FALSE( fibonacci_is_element_in_sequence(INT_MIN));
}

/* Function invoked by umain.c where all test steps are specified and subtest functions are called. */
int run_fib_tests(void) 
{
    UNITY_BEGIN();                                                                      // always start the test sequence by invoking the BEGIN function
    RUN_TEST(test_1st_element_return_1);                                                // perform test #1 (each of them prints a single line on shell)
    RUN_TEST(test_2nd_element_return_1);                                                // perform test #2
    RUN_TEST(test_3rd_element_return_2);                                                // perform test #3
    RUN_TEST(test_sequence_section);                                                    // ...
    RUN_TEST(test_negative_indeces_return_0);
    RUN_TEST(test_overdegree_indeces_return_0);
    RUN_TEST(test_value_0_is_not_in_sequence);
    RUN_TEST(test_value_1_is_in_sequence);
    RUN_TEST(test_value_2_is_in_sequence);
    RUN_TEST(test_value_3_is_in_sequence);
    RUN_TEST(test_value_4_is_not_in_sequence);
    RUN_TEST(test_value_5_is_in_sequence);
    RUN_TEST(test_values_all_values_are_in_sequence);
    RUN_TEST(test_negative_values_are_not_in_sequence);
    return UNITY_END();                                                                 // always finish the test sequence by invoking the END function
}
