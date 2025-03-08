#include <gtest/gtest.h>

#include "SomeLibrary/SomeClass.hpp"

using namespace SomeLibrary;

TEST(TestSuiteName, TestName)
{
    /* Arrange */
    const SomeClass sut { 6 };
    const std::uint32_t expectedValue = 6;

    /* Act */
    const std::uint32_t actualValue = sut.GetValue();

    /* Assert */
    ASSERT_EQ(expectedValue, actualValue);
}
