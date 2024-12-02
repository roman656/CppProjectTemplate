#include "SomeClass.hpp"

using namespace SomeLibrary;

SomeClass::SomeClass(std::uint32_t value) : m_value(value)
{}



std::uint32_t SomeClass::GetValue() const
{
    return m_value;
}
