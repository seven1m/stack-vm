(import (scheme base)
        (assert))

(assert (number? 3))
(assert (not (number? #t)))

(assert (positive? 4))
(assert (not (positive? -5)))

(assert (negative? -6))
(assert (not (negative? 7)))

(assert (zero? 0))
(assert (not (zero? 8)))

(assert (= 1 1))
(assert (not (= 1 2)))

(assert (= 3 (abs 3)))
(assert (= 3 (abs -3)))
