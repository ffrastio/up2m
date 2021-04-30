<template>
    <div id="author">
        <Navbar />
        <div class="container mx-auto md:px-4 md:py-4">
            <div class="flex items-center">
                <div class="hidden md:flex items-center mr-10 ">
                    <div class="block items center mr-4">
                        <h1 class="font-semibold block text-2xl">Authors</h1>
                        <p>Total : {{ authors.length }}</p>
                    </div>
                    <font-awesome-icon icon="users" size="2x" />
                </div>
                <div class="bg-white overflow-hidden mr-3">
                    <img
                        src="@/assets/content/content.png"
                        alt="logo PNJ"
                        class="w-20 h-20 ml-5"
                    />
                    <p>Teknik Informatika</p>
                </div>
                <!-- <div class="bg-white overflow-hidden mr-3 ">
                    <img src="@/assets/content/content.png" alt="logo PNJ" class="w-20 h-20 ml-5 mt-6">
                    <p>Teknik Grafika <br> & Penerbitan</p>
                </div>
                <div class="bg-white overflow-hidden mr-3">
                    <img src="@/assets/content/content.png" alt="logo PNJ" class="w-20 h-20 ml-5">
                    <p>Teknik Elektro</p>
                </div>
                <div class="bg-white overflow-hidden mr-3">
                    <img src="@/assets/content/content.png" alt="logo PNJ" class="w-20 h-20 ml-5">
                    <p>Teknik Mesin</p>
                </div>
                <div class="bg-white overflow-hidden mr-3">
                    <img src="@/assets/content/content.png" alt="logo PNJ" class="w-20 h-20 ml-5">
                    <p>Teknik Sipil</p>
                </div>
                <div class="bg-white overflow-hidden mr-3">
                    <img src="@/assets/content/content.png" alt="logo PNJ" class="w-20 h-20 ml-5">
                    <p>Administrasi Niaga</p>
                </div>
                <div class="bg-white overflow-hidden mr-3">
                    <img src="@/assets/content/content.png" alt="logo PNJ" class="w-20 h-20 ml-5">
                    <p>Akutansi</p>
                </div>
                <div class="bg-white overflow-hidden">
                    <img src="@/assets/content/content.png" alt="logo PNJ" class="w-20 h-20 ml-5">
                    <p>Pascasarjana</p>
                </div> -->
            </div>
        </div>
        <div class="container mx-auto px-4 py-4 text-left flex">
            <input
                type="text"
                v-model="search"
                placeholder="Search Author . . ."
                class="border-2 border-gray-300 bg-white h-10 px-5 pr-16 rounded-full text-sm focus:outline-none"
                @keyup="searchAuthor"
            />
        </div>
        <div class=" flex items-center ">
            <div class="overflow-x-auto w-full">
                <!-- Table -->
                <table
                    class="mx-auto w-full whitespace-nowrap rounded-lg bg-white divide-y divide-gray-300 overflow-hidden"
                >
                    <thead class="bg-gray-50">
                        <tr class="text-gray-600 text-left">
                            <th
                                class="font-semibold text-sm uppercase px-6 py-4 text-center"
                            >
                                author
                            </th>
                            <th
                                class="font-semibold text-sm uppercase px-6 py-4 text-center"
                            >
                                penelitian
                            </th>
                            <th
                                class="font-semibold text-sm uppercase px-6 py-4 text-center"
                            >
                                ketua
                            </th>
                            <th
                                class="font-semibold text-sm uppercase px-6 py-4 text-center"
                            >
                                anggota
                            </th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <tr v-for="author in authors" :key="author.id">
                            <td class="px-20 py-4">
                                <div class="flex items-center space-x-3">
                                    <div class="inline-flex w-20 h-20">
                                        <img
                                            class="w-20 h-20 object-cover rounded-full"
                                            alt="User avatar"
                                            src="https://source.unsplash.com/1600x900/?woman"
                                        />
                                    </div>
                                    <div>
                                        <p class="">
                                            {{ author.judul }}
                                        </p>
                                        <p>
                                            Teknik Informatika
                                        </p>
                                        <p
                                            class="text-gray-500 text-sm font-semibold tracking-wide"
                                        >
                                            123456789
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    {{ author.skimPenelitian }}
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    {{ author.ketuaPengusul }}
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                {{ author.anggota }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <Footer />
    </div>
</template>

<script>
import Navbar from "@/components/layouts/Navbar.vue";
import Footer from "@/components/layouts/Footer.vue";
import axios from "axios";
export default {
    name: "author",
    components: {
        Navbar,
        Footer
    },
    data() {
        return {
            search: "",
            authors: []
        };
    },
    methods: {
        searchAuthor() {
            axios
                .get("http://localhost:3000/penelitian?q=" + this.search)
                .then(res => (this.authors = res.data))
                .catch(err => console.log(err));
        }
    },
    mounted() {
        axios
            .get("http://localhost:3000/penelitian")
            .then(res => (this.authors = res.data))
            .catch(err => console.log(err));
    }
};
</script>

<style lang="scss" scoped></style>
