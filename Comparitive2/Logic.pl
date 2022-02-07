BinTree(X, left, right).

 / - being an empty tree */

 / adds an interger x to the binary tree T */

Insert(X, -, BinTree(X, -, -))
Insert(X, BinTree(root, left, right), BinTree(root,templeft, right))
	:- X =< root, Insert(X, left, tempright).

Insert(X, BinTree(root, left, right), BinTree(root, left, tempright))
	:- X > root, Insert(X, left, tempright).

/ Returns true if x is contained in the binary tree /
Search(X, BinTree(X, left, right)).
Search(X, BinTree(root, left, right))
	:- X =< root, Search(X, left).

Search(X, BinTree(root, left, right))
	:- Search(X, right).

/ Lists the nodes in  preorder traversal */

PreOrder(-, []).
PreOrder(BinTree(X, -, -), [X]).
PreOrder(BinTree(X, left, -), [X|T])
	:- PreOrder(left, T).

PreOrder(BinTree(X, -, right), [X|T])
	:- PreOrder(right, T).


/ Used online help for these 2 functions */

/ Lists nodes inorder using traversal*/

InOrder(-, []).
InOrder(BinTree(X, left, right), List)
	:- InOrder(left, templeft), append(List, templeft, leftresult),
	   InOrder(right, rightresult), append(leftresult, tempright, List).

/ List nodes using preorder traversal */

PostOrder(-, []).
PostOrder(BinTree(X, left, right), List)
	:- PostOrder(left, templeft), PostOrder(right, tempright),
	   append(templeft, tempright, NewList), append(NewList, [X], List).