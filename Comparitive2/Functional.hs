-- Got first few lines of code from "Trees of Int Lab sheet" |

data BinTree t = Empty | Root Int (BinTree t)(BinTree t)
                 deriving (Eq, Ord, Show)

myTree = Root 5 (Root 1 (Empty) (Root 3 Empty Empty))(Root 7 Empty Empty)

leaf x = Root x Empty Empty

-- Empty is empty tree | 


-- Insert adds X to the binary tree |
insert :: Int -> BinTree t -> BinTree t
insert a Empty = leaf a  
insert x (Root a left right)   
    | x < a  = Root a (insert x left) right  
    | otherwise  = Root a left (insert x right)

-- Returns true if x is in the Binary tree|
Search :: Ord t => BinTree t -> t -> Bool
Search Empty a = False
Search (Node left x right) a
    | x == a = True
    | a < x = Search left a
    | otherwise = Search right

-- Returns the nodes using the PreOrder traversal|
PreOrder :: Ord t => BinTree t -> [t]
PreOrder Empty = []
PreOrder (Node left x right) = [x] ++ PreOrder left ++ PreOrder right

-- Returns the nodes using the InOrder traversal|
--Used Stackoverflow for help with this|
--Not sure if working correctly|
InOrder :: BinTree t -> [Int]
InOrder Empty = []
InOrder (Root x left right) = InOrder left ++ [x] ++ InOrder right

-- Returns the nodes using the PostOrder traversal|
-- Could not get working|
PostOrder :: Ord t => BinTree t -> [t]
PostOrder Empty = []
PostOrder (Node left x right) = PostOrder left ++ PostOrder right ++ [x]


