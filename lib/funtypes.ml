(* https://stackoverflow.com/questions/55363714/is-there-are-a-way-to-use-ocamls-type-system-to-enforce-rules-about-values *)

(* check that x = y + z  [1;2;3] = [1] concat [2;3] *)
let invariant_satisfied x y z =
  x = y @ z

module Foo : sig
  type t
  type error
  val create : int list -> int list -> int list -> (t, error) result
  val get : t -> int list
end = struct
  type t = {
    all_nums: int list;
    nums1: int list;
    nums2: int list
  }
  type error = Broken_invariant
  let create all_nums nums1 nums2 =
    if invariant_satisfied all_nums nums1 nums2
    then Ok { all_nums; nums1; nums2 }
    else Error Broken_invariant
  let get a = a.all_nums
end