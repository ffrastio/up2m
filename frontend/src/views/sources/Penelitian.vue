<template>
    <div id="penelitian">
        <Navbar />
        <div class="bg-primary">
            <div class="block lg:flex items-center px-4 py-4 container mx-auto">
                <h1 class="text-white font-bold text-2xl text-left">
                    Penelitian
                </h1>
                <div class="py-4 text-left mx-auto">
                    <input
                        type="text"
                        v-model="search"
                        placeholder="Search Author . . ."
                        class="border-2 border-gray-300 bg-white h-10 px-5 pr-16 rounded-md text-sm focus:outline-none lg:w-96 w-full"
                        @keyup="searchAuthor"
                    />
                </div>
            </div>
        </div>

        <span class="mx-auto px-5 py-5">
            
                <div class="w-48 h-48 border bg-yellow-300 "></div>
        </span>
        <Footer />
    </div>
</template>

<script>
import Navbar from "@/components/layouts/Navbar.vue";
import Footer from "@/components/layouts/Footer.vue";
export default {
    name: "Penelitian",
    components: {
        Navbar,
        Footer
    }
};
</script>

<style scoped></style>
