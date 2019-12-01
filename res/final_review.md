---
layout: assignment
title: "Final exam review problems"
---

This page has final exam review problems on network communication and threads.

**Problem 1)**

What system call(s) would be used to create a server socket?

What system call(s) would be used by a server to wait for a network connection from a client?

What system call(s) would be used by a client to initiate a connection to a server?

What system call would be used to read data from a socket?

What system call would be used to write data to a socket?

Briefly explain why IP is an unreliable protocol, in the sense that an IP datagram sent might not reach its destination.

Briefly explain why a TCP connection might be abruptly terminated without without either peer explicitly closing the connection.

**Problem 2)**

State one advantage and one disadvantage of using *processes* for concurrency.

State one advantage and one disadvantage of using *threads* for concurrency.

Briefly explain why server programs typically require some form of
concurrency in their implementation.

**Problem 3)**

The following queue implementation uses a singly-linked list
as the underlying data structure.  Assume that we would like to
allow multiple threads to use a single `Queue` instance by
calling the `q_enqueue` and `q_dequeue` functions.  Show what
modifications need to be made to the data types and/or functions
in order to allow multiple threads to enqueue and dequeue items
safely.

Note: you may assume that `q_destroy` will only be called once
there are no longer any threads using the `Queue`.

```c
typedef struct Node_ {
  int val;
  struct Node_ *next;
} Node;

typedef struct {
  Node *head, *tail;
} Queue;

Queue *q_create(void) {
  Queue *q = malloc(sizeof(Queue));
  q->head = q->tail = NULL;
  return q;
}

void q_destroy(Queue *q) {
  Node *n = q->head;
  while (n != NULL) { /* delete remaining nodes */
    Node *d = n;
    n = n->next;
    free(d);
  }
  free(q);
}

void q_enqueue(Queue *q, int val) {
  Node *n = malloc(sizeof(Node));
  n->val = val;
  n->next = NULL;
  if (q->tail == NULL) {
    q->head = q->tail = n; /* add to empty queue */
  } else {
    q->tail->next = n;
    q->tail = n;
  }
}

/* Returns -1 if queue is empty */
int q_dequeue(Queue *q) {
  if (q->head == NULL) { return -1; }
  Node *n = q->head;
  int result = n->val;
  q->head = n->next;
  if (q->head == NULL) {
    q->tail = NULL; /* queue became empty */
  }
  free(n);
  return result;
}
```

**Problem 4)**

In a computation, 90% of the computation can be parallelized perfectly
(using as many processors as are available), while 10% of the computation
is inherently sequential, and can only be executed on a single processor.

What is the best speedup we can expect from parallelizing this computation?
Note that a speedup of 5 means that the parallel computation is 5 times
faster (completes in 1/5 the time) compared to a sequential computation.
