def solution(cacheSize, cities):
    cache = []
    total = 0

    for city in cities:
        city = city.lower()

        if city in cache:
            cache.remove(city)
            cache.append(city)
            total += 1
        else:
            if cacheSize > 0:
                if len(cache) == cacheSize:
                    cache.pop(0)
                cache.append(city)
            total += 5

    return total