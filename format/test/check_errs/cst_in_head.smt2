(declare-fun pred (Int Int) Bool)

(set-logic HORN)

(assert
  (forall ((n Int))
    (=> (>= n 0) (pred 42 n))
  )
)

(check-sat)