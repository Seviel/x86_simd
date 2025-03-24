#include <iostream>
#include <string>
#include <chrono>

constexpr int32_t ARRAY_SIZE = 67'108'864;

static void __attribute__((noinline)) add_arrays(float *a, float *b, float *result)
{
    for (int32_t i = 0; i < ARRAY_SIZE; ++i)
    {
        result[i] = a[i] + b[i];
    }
}

int main()
{
    std::srand(time(0));

    float *array_a = (float *)aligned_alloc(64, ARRAY_SIZE * sizeof(float));
    float *array_b = (float *)aligned_alloc(64, ARRAY_SIZE * sizeof(float));
    float *array_c = (float *)aligned_alloc(64, ARRAY_SIZE * sizeof(float));

    for (int32_t i = 0; i < ARRAY_SIZE; ++i)
    {
        array_a[i] = static_cast<float>(rand());
        array_b[i] = 1.0F / static_cast<float>(rand());
    }

    auto start = std::chrono::high_resolution_clock::now();

    add_arrays(array_a, array_b, array_c);

    auto end = std::chrono::high_resolution_clock::now();
    auto time = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();

    std::string optimize;
#ifdef OPTIMIZE
    optimize = "O3 ";
#endif

    std::cerr << "Scalar " << optimize << "execution time: " << time << " us\n";

    return 0;
}
