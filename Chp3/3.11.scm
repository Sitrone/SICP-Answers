          +-------------------------------------+
global -> |                                     |
env       | make-account                        |
          +----|--------------------------------+
               |       ^
               |       |
               v       |
               [*][*]----+
                |
                |
                v
            parameters: balance
            body: (define withdraw ...)
            (define deposit ...)
            (define dispatch ...)
            dispatch
