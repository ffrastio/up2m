<script>
import { Bar } from "vue-chartjs";

export default {
    extends: Bar,
    mounted() {
        this.renderChart(
            {
                labels: ["2017", "2018", "2019", "2020", "2021"],
                datasets: [
                    {
                        label: "Penelitian Mandiri",
                        backgroundColor: "rgb(174,104,104)",
                        data: [2, 6, 6, 5]
                    },
                    {
                        label: "Penelitian Riset Grant",
                        backgroundColor: "rgb(197,174,116)",
                        data: [4, 5, 6, 11]
                    },
                    {
                        label: "Penelitian Bidang Ilmu dan Pengembangan Institusi",
                        backgroundColor: "rgb(151,174,102)",
                        data: [5, 5, 6, 7]
                    },
                    {
                        label: "Penelitian Dosen Pemula",
                        backgroundColor: "rgb(106,191,186)",
                        data: [7, 6, 8, 9]
                    },
                    {
                        label: "Penelitian Unggulan Program Studi",
                        backgroundColor: "rgb(60,126,186)",
                        data: [8, 5, 5, 5]
                    },
                    {
                        label: "Penelitian Kerjasama Antar Perguruan Tinggi",
                        backgroundColor: "rgb(128,110,168)",
                        data: [8, 4, 4, 6]
                    },
                    {
                        label: "Penelitian Unggulan Antar Perguruan Tinggi",
                        backgroundColor: "rgb(202,52,205)",
                        data: [4, 7, 5, 13]
                    },
                    {
                        label: "Penelitian Program Terapan",
                        backgroundColor: "rgb(122,152,94)",
                        data: [2, 1, 7, 1]
                    },
                    {
                        label: "Penelitian Berbasis Penugasan",
                        backgroundColor: "rgb(19,57,115)",
                        data: [2, 4, 2, 5]
                    },
                ]
            },
            {
                responsive: true,
                maintainAspectRatio: false,
                title: {
                    display: true,
                    text: "Data Pelaksanaan Penelitian Internal Per Skim",
                    fontSize: "14",
                },
                legend: {
                    position: "bottom"
                }
            }
        );
    }
};
</script>
