#include <iostream>

#include <SomeLibrary/SomeClass.hpp>

int main([[maybe_unused]] int argc, [[maybe_unused]] char* argv[])
{
    std::cout << "Hello from main()!\n";

    const SomeLibrary::SomeClass someClass { 42 };

    std::cout << "someClass value: " << someClass.GetValue() << std::endl;

    return 0;
}
