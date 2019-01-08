

// How do you check if a given linked list contains a cycle? How do you find the starting node of the cycle?
public class CheckIfLinkedListCycle {


  public static void main(String [] args) {

    // first pointer moves two steps
    // third moves one step
    LinkedList linkedList = new LinkedList();

    // LinkedList.Node meetingNode = new LinkedList.Node("meetingNode");
    // LinkedList.Node firstNode = ;
    linkedList.add(new LinkedList.Node("firstNode"));
    linkedList.add(new LinkedList.Node("2"));
    linkedList.add(new LinkedList.Node("3"));
    linkedList.add(new LinkedList.Node("4"));
    linkedList.add(new LinkedList.Node("5"));
    LinkedList.Node tail = linkedList.tail;
    LinkedList.Node head = linkedList.head;
    // loop linked list
    tail.next = head;


    LinkedList.Node fastIterator = linkedList.head;
    LinkedList.Node slowerIterator = linkedList.head;


    boolean isCycledLinkedList = false;
    int counter = 0;

    while(fastIterator != null && slowerIterator != null) {

      slowerIterator = slowerIterator.next;
      fastIterator = fastIterator.next.next;

      if(fastIterator == slowerIterator) {
        isCycledLinkedList = true;
        break;
      }
    }

    // System.out.println("This list is " + isCycledLinkedList ? "" : " not " + " cycled linked list.");
    String joiningVerb = isCycledLinkedList ? "" : " not ";
    System.out.println("This list is " + joiningVerb + " cycled list");
  }

  public static class LinkedList {
    public Node head;
    public Node tail;


    public LinkedList() {
      this.head = new Node("head");
      this.tail = this.head;
    }


    public void add(Node node) {
      node.next = this.head;
      this.head = node;
    }

    public static class Node {
      public Node next;
      public String data;

      public Node(String data) {
        this.data = data;
        this.next = null;
      }



    }




  }

}