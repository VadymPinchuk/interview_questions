void main() {
  var five = ListNode.val(5);
  var four = ListNode.full(4, five);
  var three = ListNode.full(3, four);
  var two = ListNode.full(2, three);
  var one = ListNode.full(1, two);

  print(one);

  var oneReverced = reverseBetween(one, 1, 4);
  print(oneReverced);
  var twoReverced = reverseBetween(oneReverced, 1, 3);
  print(twoReverced);

  print(reverseList(twoReverced));
}

class ListNode {
  ListNode();

  ListNode.val(this.val);

  ListNode.full(this.val, this.next);

  int val;
  ListNode next;

  @override
  String toString() => '$val -> $next';
}

ListNode reverseBetween(ListNode head, int m, int n) {
  // Edlge cases
  if (head == null || head.next == null) return head;
  if (m == n) return head;

  // Iterate over all nodes;
  ListNode current = head;
  int counter = 1;
  // For saving edges
  ListNode startEdge = null; //Edge of not reverted list
  ListNode endEdge = null; //Last edge of reverted list

  while (current != null) {
    if (counter == m - 1) {
      startEdge = current;
    } else if (counter == m) {
      endEdge = current;
      // For reverses
      ListNode prev = null;
      ListNode next = null;

      while (counter <= n) {
        next = current.next;
        current.next = prev;
        prev = current;
        current = next;

        if (counter == n) {
          if (m == 1) {
            head = prev;
          } else {
            startEdge.next = prev;
          }
          endEdge.next = current;
          // small revert one step back - to increase it after out from while loop
          current = prev;
          break;
        }
        counter++;
      }
    }
    current = current.next;
    counter++;
  }
  return head;
}


ListNode reverseList(ListNode head) {
  ListNode current = head;
  ListNode prev = null;
  ListNode next = null;
  while (current != null) {
    next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }
  return prev;
}