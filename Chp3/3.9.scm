                +---------------------------------+
global env -->  |                                 |
                |  factorial --+                  |
                +--------------|------------------+
                               |       ^
                               |       |
                               |       |
                             [*][*]----+
                              |
                              |
                              v
                         parameters: n
                         body: (if (= n 1)
                                      1
                                      (* n (factorial (- n 1))))

                +----------------------------------------------------------+
global env -->  |                                                          |
                |  factorial --+                 fact-iter --+             |
                +--------------|-----------------------------|-------------+
                               |       ^                     |        |
                               |       |                     |        |
                               |       |                     |        |
                             [*][*]----+                   [*][*]-----+
                              |                             |
                              |                             |
                              v                             v
                       parameters: n                  parameters: product counter max-count
                       body: (fact-iter 1 1 n)        body: (if (> counter max-count)
                                                                product
                                                                (fact-iter (* counter product)
                                                                           (+ counter 1)
                                                                           max-count))
