(declare-fun pred () Bool)

(set-logic HORN)

(assert
  (=> true pred)
)

(assert
  (=> pred false)
)

(check-sat)