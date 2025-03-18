#include <benchmark/benchmark.h>

#include <SomeLibrary/SomeClass.hpp>

using namespace SomeLibrary;

static void BM_SomeClassValueGetter(benchmark::State& state)
{
    const SomeClass someClass { 42 };

    for ([[maybe_unused]] auto _ : state)
    {
        benchmark::DoNotOptimize(someClass.GetValue());
    }
}

BENCHMARK(BM_SomeClassValueGetter);
