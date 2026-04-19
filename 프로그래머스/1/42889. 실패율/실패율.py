def solution(N, stages):
    # 각 스테이지에 멈춰 있는 사람 수
    counts = [0] * (N + 2)
    for s in stages:
        counts[s] += 1

    remain = len(stages)   # 현재 스테이지에 도달한 사람 수
    failure = []

    for stage in range(1, N + 1):
        if remain == 0:
            rate = 0
        else:
            rate = counts[stage] / remain

        failure.append((rate, stage))
        remain -= counts[stage]

    failure.sort(key=lambda x: (-x[0], x[1]))
    return [stage for _, stage in failure]