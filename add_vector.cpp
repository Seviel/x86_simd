#include <iostream>
#include <chrono>
#include <immintrin.h>

constexpr int32_t ARRAY_SIZE = 67'108'864;
constexpr int32_t VEC_SIZE = 32;
constexpr int32_t ELTS_IN_VEC = 8;

static void __attribute__((noinline)) add_arrays(float *a, float *b, float *result)
{
    for (int32_t i = 0; (i + ELTS_IN_VEC) < ARRAY_SIZE; i += ELTS_IN_VEC)
    {
        __m256 vec1 = _mm256_load_ps(&a[i]);
        __m256 vec2 = _mm256_load_ps(&b[i]);
        __m256 sum = _mm256_add_ps(vec1, vec2);
        _mm256_store_ps(&result[i], sum);
    }
}

int main()
{
    std::srand(time(0));

    float *array_a = (float *)aligned_alloc(VEC_SIZE, ARRAY_SIZE * sizeof(float));
    float *array_b = (float *)aligned_alloc(VEC_SIZE, ARRAY_SIZE * sizeof(float));
    float *array_c = (float *)aligned_alloc(VEC_SIZE, ARRAY_SIZE * sizeof(float));

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

    std::cerr << "Vector " << optimize << "execution time: " << time << " us\n";

    return 0;
}
