
# x값이 다름
# y가 곧 깊이
# 부모 y > 자식 y

# return [preorder, postorder]

# 노드는 총 1~1만개
# i+1에 [x, y]
# 좌표 값은 0 ~ 10만 양수

# 트리 깊이는 1000 이하

# 배열 > 2 ^ 1000 > 불가
# 링크드리스트 > 가능
# 딕셔너리 > edge가 주어진게 아니라 어려움

import sys
sys.setrecursionlimit(10**6)

def postorder(root):
    result = []
    def dfs(node):
        if node is None:
            return
        dfs(node.left)
        dfs(node.right)
        result.append(node.i)
    dfs(root)
    return result

def preorder(root):
    result = []
    def dfs(node):
        if node is None:
            return
        result.append(node.i)
        dfs(node.left)
        dfs(node.right)
    dfs(root)
    return result

class Node:
    
    def __init__(self, i, x, y):
        self.i = i
        self.x = x
        self.y = y
        self.left = None
        self.right = None
    
    def insert(self, child):
        if child.x < self.x:
            if self.left is None:
                self.left = child
            else: 
                self.left.insert(child)
        else:
            if self.right is None:
                self.right = child
            else:
                self.right.insert(child)

def solution(nodeinfo):
    
    nodes = []
    
    for i, (x, y) in enumerate(nodeinfo):
        nodes.append(Node(i+1, x, y))
    
    nodes.sort(key=lambda node: (-node.y, node.x))
    
    root_node = nodes[0]
    
    for node in nodes[1:]:
        root_node.insert(node)
    
    return [preorder(root_node), postorder(root_node)]



