<template>
    <div id="login">
        <Navbar />
        <form @submit.prevent="handleSubmit">
            <div class="container mx-auto">
                <div class=" h-full flex justify-center items-center pt-6">
                    <div class="w-1/3">
                        <img
                            src="@/assets/img/logo.png"
                            alt="Logo Up2m"
                            class="mb-6 mx-auto"
                        />
                        <div
                            class="border rounded-lg text-left px-4 py-4 shadow-lg"
                        >
                            <div class="mb-4">
                                <label class="block font-bold mb-2"
                                    >Email</label
                                >
                                <input
                                    type="text"
                                    placeholder="Masukkan Email Anda . . ."
                                    class="border rounded-lg px-4 py-2 w-full"
                                    v-model="email"
                                />
                            </div>
                            <div class="mb-4">
                                <label class="block font-bold mb-2"
                                    >Password</label
                                >
                                <input
                                    type="Password"
                                    placeholder="Masukkan Password Anda . . ."
                                    class="border rounded-lg px-4 py-2 w-full"
                                    v-model="password"
                                />
                            </div>
                            <button
                                class="flex items-center justif-center border rounded-lg font-semibold ml-auto bg-primary text-white px-4 py-1"
                            >
                                Login
                            </button>
                            <div class="mt-4">
                                <p class="mb-3 font-bold">*Note :</p>
                                <p>
                                    - Hanya
                                    <strong class="uppercase">Pimpinan</strong>
                                    yang dapat melakukan login
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
import Navbar from "@/components/layouts/Navbar.vue";
import axios from "axios";
export default {
    name: "login",
    components: {
        Navbar
    },
    data() {
        return {
            email: "",
            password: ""
        };
    },
    methods: {
        async handleSubmit() {
            const response = await axios.post("login", {
                email: this.email,
                password: this.password
            });
            localStorage.setItem("token", response.data.token);
        }
    }
};
</script>

<style lang="scss" scoped></style>
