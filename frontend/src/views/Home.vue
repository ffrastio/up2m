<template>
    <div class="home">
        <div class="container">
            <!-- Start Navbar -->
            <Navbar />
            <!-- End Navbar -->
            <!-- Start Jumbotron -->
            <div class="mt-4 text-left d-flex align-items-center justify-content-between">
                <div class="block">
                    <p class="title">
                        Temukan Data yang <br />
                        Diinginkan
                    </p>
                    <p>
                        UP2M Menyediakan berbagai data dan <br />
                        keperluan untuk mendukung penelitian kamu
                    </p>
                    <b-button class="btn btn-cta" href="#">Temukan!</b-button>
                </div>

                <div class="img-header">
                    <b-img
                        src="@/assets/img/content/content-1.png"
                        alt="Konten"
                        class="img-header image-cover"
                        fluid
                    />
                </div>
            </div>
            <!-- End Jumbotron -->
        </div>
        <div class="text-left title mt-4 container">
            <p>Data Statistik</p>
        </div>
        <b-row class=" bg-light">
            <b-col class="col-6 mt-3">
                <LineChart1 class="img-header bg-white py-2 rounded"/>
            </b-col>
            <b-col class="col-6 mt-3">
                    <LineChart2 class="img-header bg-white rounded py-2"/>
            </b-col>
            <b-col class="col-6 mt-3 mb-3">
                <BarChart1 class="image-header bg-white py-2 rounded"/>
            </b-col>
            <b-col class="col-6 mt-3 mb-3">
                    <BarChart2 class="image-header bg-white rounded py-2"/>
            </b-col>
        </b-row>
        <Footer />
    </div>
</template>

<script>
// @ is an alias to /src
import Navbar from "@/components/layouts/Navbar.vue";
import Footer from "@/components/layouts/Footer.vue";
import LineChart1 from "@/components/chart/pengabdianLineChart.vue";
import LineChart2 from "@/components/chart/penelitianLineChart.vue";
import BarChart1 from "@/components/chart/pengabdianBarChart.vue";
import BarChart2 from "@/components/chart/penelitianBarChart.vue";

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
<style lang="scss" scoped>
.img-header {
    max-height: 350px;
}
.btn-cta {
    background-color: #008797;
    color: white;
    border: none;
}
.btn-cta:hover {
    background-color: #086670;
}
.title {
    font-weight: 500;
    font-size: 32px;
}
.img-chart {
    max-width: 50px;
}
</style>
