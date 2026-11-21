return {
  {
    prefix = "leet",
    body = [[
#include <vector>
#include <string>
using namespace std;
  ]],
  },
  {
    prefix = "calgo",
    body = [[
#include <algorithm>
    ]]
  },
  {
    prefix = "linked",
    body = [[
struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};
    ]]
  },
  {
    prefix = "tree",
    body = [[
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

    ]]
  }
}
