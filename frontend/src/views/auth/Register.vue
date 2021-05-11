<template>
  <div id="register">
    <Navbar />
    <form @submit.prevent="handleSubmit">
      <div class="container mx-auto">
        <div class=" h-full flex justify-center items-center pt-6">
          <div class="w-full lg:w-1/3">
            <img
              src="@/assets/img/logo.png"
              alt="Logo Up2m"
              class="mb-6 mx-auto"
            />
            <div class="border rounded-lg text-left px-4 py-4 shadow-lg">
              <div class="mb-4">
                <label class="block font-bold mb-2">Name</label>
                <input
                  type="text"
                  placeholder="Masukkan Nama Lengkap Anda . . ."
                  class="border rounded-lg px-4 py-2 w-full"
                  v-model="fullName"
                />
              </div>
              <div class="mb-4">
                <label class="block font-bold mb-2">Email</label>
                <input
                  type="text"
                  placeholder="Masukkan Email Anda . . ."
                  class="border rounded-lg px-4 py-2 w-full"
                  v-model="email"
                />
              </div>
              <div class="mb-4">
                <label class="block font-bold mb-2">Password</label>
                <input
                  type="Password"
                  placeholder="Masukkan Password Anda . . ."
                  class="border rounded-lg px-4 py-2 w-full"
                  v-model="password"
                />
              </div>
              <div class="mb-4">
                <label class="block font-bold mb-2">Konfirmasi Password</label>
                <input
                  type="Password"
                  placeholder="Masukkan Password Anda Sekali Lagi . . ."
                  class="border rounded-lg px-4 py-2 w-full"
                  v-model="confirmPassword"
                />
              </div>
              <button
                class="flex items-center justif-center border rounded-lg font-semibold ml-auto bg-green-400 hover:bg-green-600 text-white px-4 py-1"
              >
                Daftar
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import Navbar from "@/components/Navbar.vue";
import axios from "axios";
export default {
  name: "register",
  components: {
    Navbar,
  },
  data() {
    return {
      fullName: "",
      email: "",
      password: "",
      confirmPassword: "",
    };
  },
  methods: {
    async handleSubmit() {
      await axios.post("register", {
        fullName: this.fullName,
        email: this.email,
        password: this.password,
        confirmPasswrod: this.confirmPassword,
      });

      this.$router.push('/login');
    },
  },
};
</script>

<style lang="scss" scoped></style>
