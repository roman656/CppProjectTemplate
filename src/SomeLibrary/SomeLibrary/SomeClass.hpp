#ifndef SOMELIBRARY_SOMECLASS_HPP
#define SOMELIBRARY_SOMECLASS_HPP

#include <cstdint>

namespace SomeLibrary
{

class SomeClass final
{
public:
    explicit SomeClass(std::uint32_t value);

    [[nodiscard]]
    std::uint32_t GetValue() const;

private:
    std::uint32_t m_value = 0;
};

}

#endif // SOMELIBRARY_SOMECLASS_HPP
