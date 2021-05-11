<template>
    <div class="about">
        <Navbar />
        <div class="container mx-auto">
            <div class="block md:flex px-4 animate-popup">
                <div class="md:block left-0 top-0 md:w-1/2 text-left mt-4 md:mt-24">
                    <p class="text-2xl font-bold">
                        Visi Penelitian
                    </p>
                    <p class="mt-4">
                        Pengembangan Penelitian Terapan yang Berorientasi Produk
                        dan Jasa dengan mengedepankan Produk Ramah Lingkungan
                    </p>
                </div>
                <div class="md:block right-0 top-0 md:w-1/2 text-left mt-4">
                    <p class="text-2xl font-bold">
                        Misi Penelitian
                    </p>
                    <p class="mt-4">
                        1. Menyelenggarakan koordinasi aktivitas penelitian dan
                        pengabdian masyarakat bedasarkan hasil-hasil penelitian
                        program studi, <br />2. Menyelenggarakan koordinasi
                        aktivitas penelitian dan pengabdian masyarakat yang
                        bertujuan untuk mengimplementasikan visi-misi Politeknik
                        Negeri Jakarta, <br />3. Menyelenggarakan aktivitas yang
                        bertujuan untuk meningkatkan keahlian sumber daya
                        penelitian sesuai dengan keunikan program studi,
                        <br />4. Melakukan Monitoring dan evaluasi terhadap
                        setiap aktivitas Penelitian dan Pengabdian masyarakat,
                    </p>
                </div>
            </div>
            <div class="block md:flex px-4 animate-popup">
                <div class="md:block left-0 top-14 md:w-1/2 text-left mt-4 md:mt-24">
                    <p class="text-2xl font-bold">
                        Visi Pengabdian
                    </p>
                    <p class="mt-4">
                        Implementasi Teknologi tepat guna untuk meningkatkan
                        Kesejahteraan Masyarakat Melalui Kegiatan Pengabdian
                        Masyarakat
                    </p>
                </div>
                <div class="md:block right-0 top-14 md:w-1/2 text-left mt-4 mb-4">
                    <p class="text-2xl font-bold">
                        Misi Pengabdian
                    </p>
                    <p class="mt-4">
                        1. Mengkoordinasikan, merencanakan, melaksanakan,
                        memantau, dan menilai serta mendokumentasikan pelaksaan
                        kegiatan penelitian. <br />2. Meningkatkan daya saing
                        dosen dalam kegiatan Penelitian di tingkat nasional dan
                        internasional, baik melalui kegiatan Penelitian Mandiri
                        atau kerjasama. <br />3. Meningkatkan kerjasama
                        Penelitian di tingkat nasional dan internasional.
                        <br />4. Mengerahkan kegiatan Penelitan yang
                        berorientasi produk (fisik atau nonfisik) dan/atau
                        perolehan Hak Kekayaan Intelektual (HKI). <br />5.
                        Mendiseminasikan hasil Penelitian. <br />6. Membangun
                        sistem hasi Penelitian. <br />7. Meningkatkan
                        pemanfaatan hasil Penelitian untuk pengembangan.
                    </p>
                </div>
            </div>
        </div>
        <Footer />
    </div>
</template>

<script>
import Navbar from "@/components/layouts/Navbar.vue";
import Footer from "@/components/layouts/Footer.vue";
export default {
    name: "About",
    components: {
        Navbar,
        Footer
    }
};
</script>

<style lang="scss" scoped></style>
