---
layout: assignment
title: "Final exam review problems"
---

This page has final exam review problems on network communication and threads.

**Problem 1)**

*What system call(s) would be used to create a server socket?*

`socket`: creates the socket

`bind`: associates the socket with a network address (to determine which network interface(s) the server will listen on)

`listen`: makes the socket a server socket so it can accept incoming connections

*What system call(s) would be used by a server to wait for a network connection from a client?*

`accept`: uses a server socket to wait for an incoming client connection

*What system call(s) would be used by a client to initiate a connection to a server?*

`socket`: creates the socket

`connect`: initiates connection to specified server/port

*What system call would be used to read data from a socket?*

`read` or `recv`

*What system call would be used to write data to a socket?*

`write` or `send`

*Briefly explain why IP is an unreliable protocol, in the sense that an IP datagram sent might not reach its destination.*

When datagrams are sent to a destination on the network, they must be forwarded via intermediate routers.  Each router is forwarding datagrams from many communication streams to outgoing, fixed-capacity network links.  Since the links are fixed-capacity, datagrams may need to be queued until capacity on the appropriate outgoing link is available.  These queues are fixed-size, so if a datagram arrives and the queue associated with the appropriate outgoing link is full, the datagram is discarded (dropped.)

*Briefly explain why a TCP connection might be abruptly terminated without without either peer explicitly closing the connection.*

TCP requires explicit acknowledgment for all data sent to the remote peer.  If the acknowledgment is delayed for too long, the OS will assume that the host has become unreachable and terminate the connection.  Because IP is unreliable, this can happen even if neither the sender nor the receiver have explicitly closed the connection.

**Problem 2)**

*State one advantage and one disadvantage of using processes for concurrency.*

Advantages: relatively easy to create, can inherit open files from parent, each process is isolated from other processes.

Disadvantages: heavyweight, more time to create and destroy, more time to context-switch between.

*State one advantage and one disadvantage of using threads for concurrency.*

Advantages: relatively lightweight, can easily share resources because they run in a common process context and address space.

Disadvantages: communication between threads using shared data requries synchronization.

*Briefly explain why server programs typically require some form of
concurrency in their implementation.*

In general many clients can be connected to a server simultaneously, so some form of concurrency is needed to handle communication with clients.

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

\[See the [questions](final_review.html) for the original code.\]

```c
typedef struct Node_ {
  int val;
  struct Node_ *next;
} Node;

typedef struct {
  Node *head, *tail;
  pthread_mutex_t lock;
} Queue;

Queue *q_create(void) {
  Queue *q = malloc(sizeof(Queue));
  q->head = q->tail = NULL;
  pthread_mutex_init(&q->lock, NULL);
  return q;
}

void q_destroy(Queue *q) {
  Node *n = q->head;
  while (n != NULL) { /* delete remaining nodes */
    Node *d = n;
    n = n->next;
    free(d);
  }
  pthread_mutex_destroy(&q->lock);
  free(q);
}

void q_enqueue(Queue *q, int val) {
  Node *n = malloc(sizeof(Node));
  n->val = val;
  n->next = NULL;

  pthread_mutex_lock(&q->lock);
  if (q->tail == NULL) {
    q->head = q->tail = n; /* add to empty queue */
  } else {
    q->tail->next = n;
    q->tail = n;
  }
  pthread_mutex_unlock(&q->lock);
}

/* Returns -1 if queue is empty */
int q_dequeue(Queue *q) {
  int result;

  pthread_mutex_lock(&q->lock);

  if (q->head == NULL) {
    result = -1;
  } else {
    Node *n = q->head;
    result = n->val;
    q->head = n->next;
    if (q->head == NULL) {
      q->tail = NULL; /* queue became empty */
    }
    free(n);
  }

  pthread_mutex_unlock(&q->lock);

  return result;
}
```

**Problem 4)**

<i>In a computation, 90% of the computation can be parallelized perfectly
(using as many processors as are available), while 10% of the computation
is inherently sequential, and can only be executed on a single processor.</i>

<i>What is the best speedup we can expect from parallelizing this computation?
Note that a speedup of 5 means that the parallel computation is 5 times
faster (completes in 1/5 the time) compared to a sequential computation.</i>

Let t<sub>s</sub> be the running time of the sequential program.

Running time of parallel program (t<sub>p</sub>):

> t<sub>p</sub> = 0.1 &times; t<sub>s</sub> + (0.9 &times; t<sub>s</sub> / P)

A P increases, (t<sub>s</sub> / P) approaches 0, so with a large number of processors,
t<sub>p</sub> approaches

> 0.1 &times; t<sub>s</sub>

Speedup (S) is t<sub>s</sub> / t<sub>p</sub>, which as P &rarr; ∞ becomes

> S = t<sub>s</sub> / (0.1 &times; t<sub>s</sub>) = 10

So, the largest speedup for this computation, assuming that the proportion of
sequential vs. parallel computation is fixed regardless of problems, size,
is 10.

Note that assuming that the proportion of inherently sequential computation
is independent of problem size is not, in general, a good assumption.
