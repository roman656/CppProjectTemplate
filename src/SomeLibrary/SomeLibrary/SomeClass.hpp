#ifndef SOMELIBRARY_SOMECLASS_HPP
#define SOMELIBRARY_SOMECLASS_HPP

#include <cstdint>

namespace SomeLibrary
{

class SomeClass final
{
public:
    explicit SomeClass(std::uint32_t value = 0);

    std::uint32_t GetValue() const;

private:
    std::uint32_t m_value;
};

}

#endif // SOMELIBRARY_SOMECLASS_HPP
