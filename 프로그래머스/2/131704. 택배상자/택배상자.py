# @time 20
# @tags Stack

def solution(order):
    sub_container = []
    truck = []

    order.reverse()

    for cur in range(1, len(order) + 1):
        sub_container.append(cur)

        while (
            order
            and sub_container
            and order[-1] == sub_container[-1]
        ):
            truck.append(sub_container.pop())
            order.pop()

    return len(truck)