# Ch12

Choosen exercises from Chapter 12. Some commands were slightly modified.

---

# Table of contents

1. [Task 1](#task-1)

---

## Task 1

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `Task1.hs`

Given that:

<pre>
data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

-- and
data Patient = Patient {
	name :: Name
	, sex :: Sex
	, age :: Int
	, height :: Int
	, weight :: Int
	, bloodType :: BloodType }
</pre>

Implement a `patientSummary` function that prints the output like this:

<pre>
**************
Patient Name: Smith, John
Sex: Male
Age: 46
Height: 72 in.
Weight: 210 lbs.
Blood Type: AB+
**************
</pre>

