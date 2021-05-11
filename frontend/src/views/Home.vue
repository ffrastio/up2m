<template>
    <div class="home">
        <!-- Start: Navbar -->
        <Navbar/>
        <!-- Ends: Navbar -->
        <!-- Start Section Hero -->
        <section class="container flex mx-auto items-center text-left">
            <div
                class="container mx-auto flex flex-col md:flex-row items-center my-12 md:my-14"
            >
                <!--Left Col-->
                <div
                    class="flex flex-col w-full lg:w-1/2 justify-items-start items-start pt-12 pb-24 px-6"
                >
                    
                    <h1 class="font-bold text-3xl my-4">Temukan Data  yang Diinginkan</h1>
                    <p class="leading-normal mb-4">
                        UP2M Menyediakan berbagai data dan <br> keperluan untuk mendukung penelitian kamu
                    </p>
                    <button
                        class="bg-primary hover:bg-primary-200 text-white hover:text-white rounded shadow hover:shadow-lg py-2 px-4 border"
                    >
                        Temukan !
                    </button>
                </div>
                <!--Right Col-->
                <div class="w-full lg:w-1/2 lg:py-6 text-center">
                    <!--Add your product image here-->
                    <img src="@/assets/content/header.png" alt="Header" class="img-header">
                </div>
            </div>
        </section>
        <!-- Ends Section Hero -->
        <!-- Start Data Statistik -->
        <div class="text-xl text-left font-bold py-4 px-4">Data Statistik</div>
        <div
            class="bg-gray-200 px-4 py-4 grid grid-cols-1 gap-2 md:grid-cols-2 mb-4 animate-popup"
        >
            <LineChart1 class="bg-white rounded" />
            <LineChart2 class="bg-white rounded" />
            <BarChart1 class="bg-white rounded" />
            <BarChart2 class="bg-white rounded" />
        </div>
        <!-- Ends Data Statistik -->
        <Footer />
    </div>
</template>

<script>
// @ is an alias to /src
import Navbar from "@/components/layouts/Navbar.vue";
import Footer from "@/components/layouts/Footer.vue";
import LineChart1 from "@/components/chart/penelitianLineChart.vue";
import LineChart2 from "@/components/chart/pengabdianLineChart.vue";
import BarChart1 from "@/components/chart/penelitianBarChart.vue";
import BarChart2 from "@/components/chart/pengabdianBarChart.vue";

export default {
    name: "Home",
    components: {
        Navbar,
        Footer,
        LineChart1,
        LineChart2,
        BarChart1,
        BarChart2
    }
};
</script>
<style>
.img-header {
    max-height: 400px;
}
</style>
