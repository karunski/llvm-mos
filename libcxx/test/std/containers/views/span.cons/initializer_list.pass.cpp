//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
// UNSUPPORTED: c++03, c++11, c++14, c++17

// <span>

#include <span>
#include <cassert>

struct Sink {
    constexpr Sink() = default;
    constexpr Sink(Sink*) {}
};

constexpr int count(std::span<const Sink> sp) {
    return sp.size();
}

template<int N>
constexpr int countn(std::span<const Sink, N> sp) {
    return sp.size();
}

constexpr bool test() {
    Sink a[10];
    assert(count({a}) == 10);
    assert(count({a, a+10}) == 10);
    assert(countn<10>({a}) == 10);
    return true;
}

int main(int, char**)
{
    test();
    static_assert(test());

    return 0;
}
