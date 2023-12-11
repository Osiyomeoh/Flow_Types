access(all) contract SomeContract {
    pub var testStruct: SomeStruct

    pub struct SomeStruct {

        //
        // 4 Variables
        //

        pub(set) var a: String

        pub var b: String

        access(contract) var c: String

        access(self) var d: String

        //
        // 3 Functions
        //

        pub fun publicFunc() {}

        access(contract) fun contractFunc() {}

        access(self) fun privateFunc() {}


        pub fun structFunc() {
            /**************/
            /*** AREA 1 ***/
            /*
            Variables
            a (pub(set)): Readable and writable.
            b (pub): Readable, not writable.
            c (access(contract)): Readable, not writable.
            d (access(self)): Readable and writable.
            Functions
            publicFunc: Callable.
            contractFunc: Callable.
            privateFunc: Callable.*/
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    pub resource SomeResource {
        pub var e: Int

        pub fun resourceFunc() {
            /**************/
            /*** AREA 2 ***/
            /*
            Variables
            a (pub(set)): Readable, not writable.
            b (pub): Readable, not writable.
            c (access(contract)): Readable, not writable.
            d (access(self)): Not accessible.
            Functions
            publicFunc: Callable.
            contractFunc: Not callable.
            privateFunc: Not callable.*/
        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
        /**************/
        /*** AREA 3 ****/
        /*
        Variables
        a (pub(set)): Readable, not writable.
        b (pub): Readable, not writable.
        c (access(contract)): Readable, not writable.
        d (access(self)): Not accessible.
        Functions
        publicFunc: Callable.
        contractFunc: Not callable.
        privateFunc: Not callable.
        */
    }

    init() {
        self.testStruct = SomeStruct()
    }
}
