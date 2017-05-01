import LogicKit

// Numbers:

let d0 = Value (0)
let d1 = Value (1)
let d2 = Value (2)
let d3 = Value (3)
let d4 = Value (4)
let d5 = Value (5)
let d6 = Value (6)
let d7 = Value (7)
let d8 = Value (8)
let d9 = Value (9)

func toNumber (_ n : Int) -> Term {
    var result = List.empty
    for char in String (n).characters.reversed () {
        switch char {
        case "0":
            result = List.cons (d0, result)
        case "1":
            result = List.cons (d1, result)
        case "2":
            result = List.cons (d2, result)
        case "3":
            result = List.cons (d3, result)
        case "4":
            result = List.cons (d4, result)
        case "5":
            result = List.cons (d5, result)
        case "6":
            result = List.cons (d6, result)
        case "7":
            result = List.cons (d7, result)
        case "8":
            result = List.cons (d8, result)
        case "9":
            result = List.cons (d9, result)
        default:
            assert (false)
        }
    }
    return result
}

// Arithmetic:
// l, r in Nat
// ------------
// l + r in Nat

func add (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op"  : Value ("+"),
    "lhs" : lhs,
    "rhs" : rhs,
  ]

}

// l, r in Nat, l>= r
// ------------
// l - r in Nat
func subtract (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op"  : Value ("-"),
    "lhs" : lhs,
    "rhs" : rhs,
  ]

}

// l, r in Nat
// ------------
// l * r in Nat
func multiply (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op"  : Value ("*"),
    "lhs" : lhs,
    "rhs" : rhs,
  ]

}

// l, r in Nat, r != 0
// ------------
// l/r in Nat
func divide (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op"  : Value ("/"),
    "lhs" : lhs,
    "rhs" : rhs,
  ]

}

// Booleans:

let t = Value (true)
let f = Value (false)

// b in B
// ------------
// not (b) in B

func not (_ of: Term) -> Map {
  return [
    "op": Value ("not"),
    "what": of,
  ]

}

// a, b in B
// ------------
// a and b in B
func and (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op": Value ("and"),
    "lhs": lhs,
    "rhs": rhs,
  ]

}

// a, b in B
// ------------
// a or b in B
func or (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op": Value ("or"),
    "lhs": lhs,
    "rhs": rhs,
  ]

}

// a, b in B
// ------------
// a implies b in B
func implies (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op": Value ("implies"),
    "lhs": lhs,
    "rhs": rhs,
  ]

}

// Comparisons:
// a, b in Nat
// ------------
// a lessthan b in B

func lessthan (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op": Value ("lessthan"),
    "lhs": lhs,
    "rhs": rhs,
  ]

}

// a, b in Nat
// ------------
// a lessequal b in B
func lessequal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op": Value ("lessequal"),
    "lhs": lhs,
    "rhs": rhs,
  ]

}

// a, b in Nat
// ------------
// a greaterthan b in B
func greaterthan (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op": Value ("greaterthan"),
    "lhs": lhs,
    "rhs": rhs,
  ]

}

// a, b in Nat
// ------------
// a greaterequal b in B
func greaterequal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op": Value ("greaterequal"),
    "lhs": lhs,
    "rhs": rhs,
  ]

}

// a, b in Nat
// ------------
// a equal b in B
func equal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op": Value ("equal"),
    "lhs": lhs,
    "rhs": rhs,
  ]

}

// a, b in Nat
// ------------
// a notequal  b in B
func notequal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "op": Value ("notequal"),
    "lhs": lhs,
    "rhs": rhs,
  ]


}

func addchiffre (lhs: Term, rhs: Term, result: Term, rest: Term) -> Goal {
  return
    (lhs === d0 &&  result === rhs && rest === d0) ||
    (rhs === d0 && result === lhs && rest === d0) ||
    (lhs === d1 && rhs === d1 && result === d2 && rest === d0) ||
    (lhs === d1 && rhs === d2 && result === d3 && rest === d0) ||
    (lhs === d1 && rhs === d3 && result === d4 && rest === d0) ||
    (lhs === d1 && rhs === d4 && result === d5 && rest === d0) ||
    (lhs === d1 && rhs === d5 && result === d6 && rest === d0) ||
    (lhs === d1 && rhs === d6 && result === d7 && rest === d0) ||
    (lhs === d1 && rhs === d7 && result === d8 && rest === d0) ||
    (lhs === d1 && rhs === d8 && result === d9 && rest === d0) ||
    (lhs === d1 && rhs === d9 && result === d0 && rest === d1) ||

    (lhs === d2 && rhs === d1 && result === d3 && rest === d0) ||
    (lhs === d2 && rhs === d2 && result === d4 && rest === d0) ||
    (lhs === d2 && rhs === d3 && result === d5 && rest === d0) ||
    (lhs === d2 && rhs === d4 && result === d6 && rest === d0) ||
    (lhs === d2 && rhs === d5 && result === d7 && rest === d0) ||
    (lhs === d2 && rhs === d6 && result === d8 && rest === d0) ||
    (lhs === d2 && rhs === d7 && result === d9 && rest === d0) ||
    (lhs === d2 && rhs === d8 && result === d0 && rest === d1) ||
    (lhs === d2 && rhs === d9 && result === d1 && rest === d1) ||

    (lhs === d3 && rhs === d1 && result === d4 && rest === d0) ||
    (lhs === d3 && rhs === d2 && result === d5 && rest === d0) ||
    (lhs === d3 && rhs === d3 && result === d6 && rest === d0) ||
    (lhs === d3 && rhs === d4 && result === d7 && rest === d0) ||
    (lhs === d3 && rhs === d5 && result === d8 && rest === d0) ||
    (lhs === d3 && rhs === d6 && result === d9 && rest === d0) ||
    (lhs === d3 && rhs === d7 && result === d0 && rest === d1) ||
    (lhs === d3 && rhs === d8 && result === d1 && rest === d1) ||
    (lhs === d3 && rhs === d9 && result === d2 && rest === d1) ||

    (lhs === d4 && rhs === d1 && result === d5 && rest === d0) ||
    (lhs === d4 && rhs === d2 && result === d6 && rest === d0) ||
    (lhs === d4 && rhs === d3 && result === d7 && rest === d0) ||
    (lhs === d4 && rhs === d4 && result === d8 && rest === d0) ||
    (lhs === d4 && rhs === d5 && result === d9 && rest === d0) ||
    (lhs === d4 && rhs === d6 && result === d0 && rest === d1) ||
    (lhs === d4 && rhs === d7 && result === d1 && rest === d1) ||
    (lhs === d4 && rhs === d8 && result === d2 && rest === d1) ||
    (lhs === d4 && rhs === d9 && result === d3 && rest === d1) ||

    (lhs === d5 && rhs === d1 && result === d6 && rest === d0) ||
    (lhs === d5 && rhs === d2 && result === d7 && rest === d0) ||
    (lhs === d5 && rhs === d3 && result === d8 && rest === d0) ||
    (lhs === d5 && rhs === d4 && result === d9 && rest === d0) ||
    (lhs === d5 && rhs === d5 && result === d0 && rest === d1) ||
    (lhs === d5 && rhs === d6 && result === d1 && rest === d1) ||
    (lhs === d5 && rhs === d7 && result === d2 && rest === d1) ||
    (lhs === d5 && rhs === d8 && result === d3 && rest === d1) ||
    (lhs === d5 && rhs === d9 && result === d4 && rest === d1) ||

    (lhs === d6 && rhs === d1 && result === d7 && rest === d0) ||
    (lhs === d6 && rhs === d2 && result === d8 && rest === d0) ||
    (lhs === d6 && rhs === d3 && result === d9 && rest === d0) ||
    (lhs === d6 && rhs === d4 && result === d0 && rest === d1) ||
    (lhs === d6 && rhs === d5 && result === d1 && rest === d1) ||
    (lhs === d6 && rhs === d6 && result === d2 && rest === d1) ||
    (lhs === d6 && rhs === d7 && result === d3 && rest === d1) ||
    (lhs === d6 && rhs === d8 && result === d4 && rest === d1) ||
    (lhs === d6 && rhs === d9 && result === d5 && rest === d1) ||

    (lhs === d7 && rhs === d1 && result === d8 && rest === d0) ||
    (lhs === d7 && rhs === d2 && result === d9 && rest === d0) ||
    (lhs === d7 && rhs === d3 && result === d0 && rest === d1) ||
    (lhs === d7 && rhs === d4 && result === d1 && rest === d1) ||
    (lhs === d7 && rhs === d5 && result === d2 && rest === d1) ||
    (lhs === d7 && rhs === d6 && result === d3 && rest === d1) ||
    (lhs === d7 && rhs === d7 && result === d4 && rest === d1) ||
    (lhs === d7 && rhs === d8 && result === d5 && rest === d1) ||
    (lhs === d7 && rhs === d9 && result === d6 && rest === d1) ||

    (lhs === d8 && rhs === d1 && result === d9 && rest === d0) ||
    (lhs === d8 && rhs === d2 && result === d0 && rest === d1) ||
    (lhs === d8 && rhs === d3 && result === d1 && rest === d1) ||
    (lhs === d8 && rhs === d4 && result === d2 && rest === d1) ||
    (lhs === d8 && rhs === d5 && result === d3 && rest === d1) ||
    (lhs === d8 && rhs === d6 && result === d4 && rest === d1) ||
    (lhs === d8 && rhs === d7 && result === d5 && rest === d1) ||
    (lhs === d8 && rhs === d8 && result === d6 && rest === d1) ||
    (lhs === d8 && rhs === d9 && result === d7 && rest === d1) ||

    (lhs === d9 && rhs === d1 && result === d0 && rest === d1) ||
    (lhs === d9 && rhs === d2 && result === d1 && rest === d1) ||
    (lhs === d9 && rhs === d3 && result === d2 && rest === d1) ||
    (lhs === d9 && rhs === d4 && result === d3 && rest === d1) ||
    (lhs === d9 && rhs === d5 && result === d4 && rest === d1) ||
    (lhs === d9 && rhs === d6 && result === d5 && rest === d1) ||
    (lhs === d9 && rhs === d7 && result === d6 && rest === d1) ||
    (lhs === d9 && rhs === d8 && result === d7 && rest === d1) ||
    (lhs === d9 && rhs === d9 && result === d8 && rest === d1)
}




func reverseAcc (list: Term, acc: Term, reversed: Term) -> Goal {
  return
     (list === List.empty && reversed === acc) ||
     delayed (
     freshn { t in
        let head = t ["head"]
        let tail = t ["tail"]
        return list === List.cons (head, tail) &&
        (reverseAcc (list: tail, acc: List.cons (head, acc), reversed: reversed))
      })
}


func reverse (list: Term, reversed: Term) -> Goal {
  return reverseAcc (list: list, acc: List.empty, reversed: reversed)

}
//result est les successeur de lhs, ici on a definit une notion de successeur sur les chiffre 1 à 9
func succ(lhs: Term, result: Term) -> Goal {
  return
    (lhs === d0 && result === d1) ||
    delayed ( freshn { a in
      let x = a ["x"]
    return addnbr(lhs: lhs, rhs: List.cons(d1, List.empty), result: x) && result === x
    })
}

func subchiffre(a: Term, b: Term, result: Term) -> Goal{
  return
    (b === d0 && result === a) ||
    delayed ( freshn { l in
      let x = l ["x"]
      let y = l ["y"]
      return succ(lhs: x, result: a) && succ(lhs: y, result: b) && subchiffre(a: x, b: y, result: result)
    })
}
//on se limite aux soustractions avec resultat positif donc il n'y a que le second parametre qui puisse etre nul
func subnbr (lhs: Term, rhs: Term, result: Term) -> Goal {
  return
     (rhs === List.empty && result === lhs) ||
     (rhs === lhs && result === d0) ||
  delayed ( freshn { a in
      let lhead = a ["lhead"]
      let rhead = a ["rhead"]
      let ltail = a ["ltail"]
      let rtail = a ["rtail"]
      let x = a ["x"]
      let y = a ["y"]
      let z = a ["z"]
      let p = a ["p"]
      let q = a ["q"]
      let rec = a ["rec"]
      //extraire 1er chiffre lhs
      return lhs === List.cons (lhead, ltail) &&
      //extraire 1er chiffre rhs
      rhs === List.cons (rhead, rtail) &&
      //on 10 et la tete du 2eme parametre
      subchiffre(a: List.cons(d1, List.cons(d0, List.empty)), b: rhead, result: p) &&
      //le resultat on additionne a la tete du premier parametre
      addchiffre(lhs: lhead, rhs: p, result: z, rest: q) &&
      //le reste de laddition qui precede , on aditionne a la queue du 1er parametre (retenue de laddition precedante)
      addnbr (lhs: ltail, rhs: q, result: x) &&
      //ajout de la  dizaine empruntee au depart, on donc 1 a la queue du 2eme parametre
      addnbr(lhs: rtail, rhs: List.cons (d1, List.empty), result: y) &&
      //puis on soustrait  recurssivemen les nouvelle "queue" : x et y
      subnbr (lhs: x, rhs: y, result: rec) &&

      //retourne le resultat
      result === List.cons (z, rec)

  })
}

func mult(lhs: Term, rhs: Term, result: Term) -> Goal {
  return
    (rhs === d0 && result === d0) ||
    (rhs === d1 && result === lhs) ||
    delayed ( freshn { l in
      let r = l ["r"]
      let x = l ["x"]
      return addnbr(lhs: lhs, rhs: result, result: r) &&
      succ(lhs: x, result: rhs) && mult(lhs: lhs, rhs: x, result: r)
    })
  }
//on traite seulement le cas ou le diviseur nest pas 0
//func div(nbre: Term, diviseur: Term, result: Term, rest: Term) -> Goal{

//}


func addnbr (lhs: Term, rhs: Term, result: Term) -> Goal {
  return (lhs === List.empty && result === rhs ) ||
     (rhs === List.empty && result === lhs) ||
  delayed ( freshn { a in
      let lhead = a ["lhead"]
      let rhead = a ["rhead"]
      let ltail = a ["ltail"]
      let rtail = a ["rtail"]
      let x = a ["x"]
      let y = a ["y"]
      let z = a ["z"]
      let rec = a ["rec"]
      //extraire 1er chiffre lhs
      return lhs === List.cons (lhead, ltail) &&
      //extraire 1er chiffre rhs
      rhs === List.cons (rhead, rtail) &&
      //additionner les deux chiffres
      addchiffre (lhs: lhead, rhs: rhead, result: x, rest: y) &&
      //ajout de la retenue
      addnbr(lhs: ltail, rhs: List.cons (y, List.empty), result: z) &&
      //additionner recurssivemen les rest de nbr
      addnbr (lhs: z, rhs: rtail, result: rec) &&
      //ou on aurait pu ajouter la retenue ici
      //TODO si on veut
      //retourne le resultat
      result === List.cons (x, rec)

  })
}

// Evaluation:

func evalArithmetic (input: Term, output: Term) -> Goal {
  return
    delayed (freshn { g in
      let l  = g ["l"]
      let r  = g ["r"]
      let lv = g ["lv"]
      let rv = g ["rv"]
        return
          (input === add (l, r) &&
          reverse (list: l, reversed: lv) && reverse (list: r, reversed: rv) &&
          addnbr (lhs: lv, rhs: rv, result: output)) ||
          (input === multiply(l, r) && reverse (list: l, reversed: lv) &&
           mult(lhs: lv, rhs: r, result: output)) ||
           (input === subtract(l, r) &&
            subnbr(lhs: l, rhs: r, result: output))

      })



    //assert (false)
}

func evalBoolean (input: Term, output: Term) -> Goal {
  return
    //
    // --------------
    // true -B-> true
    (input === t && output === t)
    ||
    //
    // ----------------
    // false -B-> false
    (input === f && output === f)
    ||
    // l -B-> lv, r -B->rv
    // ---------------------
    // l and r -B-> lv && rv
    delayed (freshn { g in
      let l  = g ["l"]
      let r  = g ["r"]
      let lv = g ["lv"]
      let rv = g ["rv"]
      return input === and (l, r) &&
             evalBoolean (input:l, output:lv) &&
             evalBoolean (input:r, output:rv) &&
             (
               (lv === t && rv === t && output === t)
               ||
               (lv === f && output === f)
               ||
               (rv === f && output === f)
             )
    })
    ||
    // l -B-> lv, r -B->rv
    // ---------------------
    // l or r -B-> lv or rv
    delayed (freshn { g in
      let l  = g ["l"]
      let r  = g ["r"]
      let lv = g ["lv"]
      let rv = g ["rv"]
      return input === or (l, r) &&
             evalBoolean (input:l, output:lv) &&
             evalBoolean (input:r, output:rv) &&
             (
               (lv === f && rv === f && output === f)
               ||
               (lv === t && output === t)
               ||
               (rv === t && output === t)
             )
    })
    ||
    // l -B-> lv,
    // ---------------------
    // not l  -B-> not lv
    delayed (freshn { g in
      let l  = g ["l"]
      let lv = g ["lv"]
      return input === not(l) &&
             evalBoolean (input:l, output:lv) &&
             (
               (lv === f && output === t)
               ||
               (lv === t && output === f)
             )
    })
    ||
    // l -B-> lv, r -B->rv
    // ---------------------
    // l implies r -B-> lv implies rv
    delayed (freshn { g in
      let l  = g ["l"]
      let r  = g ["r"]
      let lv = g ["lv"]
      let rv = g ["rv"]
      return input === implies (l, r) &&
             evalBoolean (input:l, output:lv) &&
             evalBoolean (input:r, output:rv) &&
             (
               (lv === f && output === t)
               ||
               (lv === t && rv === f  && output === f)
               ||
               (lv === t && rv === t && output === t)
             )
    })


}

func evalComparison (input: Term, output: Term) -> Goal {
    assert (false)
}

// Main evaluation:

func eval (input: Term, output: Term) -> Goal {
    assert (false)
}
