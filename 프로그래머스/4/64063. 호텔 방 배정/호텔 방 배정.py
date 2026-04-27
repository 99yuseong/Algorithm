import sys

sys.setrecursionlimit(10**6)

def find_room(next_rooms, cur_room_no):
    
    if cur_room_no not in next_rooms:
        next_rooms.setdefault(cur_room_no, cur_room_no + 1)
        return cur_room_no
    
    next_rooms[cur_room_no] = find_room(next_rooms, next_rooms[cur_room_no])
    
    return next_rooms[cur_room_no]

def solution(k, room_number):
    
    next_rooms = {}
    
    n = len(room_number)
    result = []
    
    for i in range(n):
        room = find_room(next_rooms, room_number[i])
        result.append(room)
        
    return result