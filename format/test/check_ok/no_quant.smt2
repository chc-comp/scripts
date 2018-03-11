(declare-fun pred () Bool)

(set-logic HORN)

(assert
  (forall ((n Int))
    (=> (>= n 0) pred)
  )
)

(assert
  (=> pred false)
)

(check-sat)