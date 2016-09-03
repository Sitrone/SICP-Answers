1. 显示派：新增操作时寻村避免命令冲突，且每增加一种新类型或者新操作，所有通用的操作都要做相应的改动，因此，这种策略不具有可加性
，两种都不适合

2. 数据导向：通过包机制增加新类型和新的通用操作都很方便，都适合

3. 消息传递：可以很方便的增加新类型，不适合增加新操作，因为已有的操作已经和已有的数据对象进行了匹配，如果每次对某个数据增加新的操作之后，需要
对数据对象已有的实例全部重新实例化才能使用新的操作。

Ref：
Message-passing style is the most appropriate when new types must often be added.

Data-directed style is the most appropriate when new operations must often be added.

This is the well-known expression problem（http://c2.com/cgi/wiki?ExpressionProblem）

考虑一个问题：如何在大型系统中运用数据导向(data-objected)的设计方式？
