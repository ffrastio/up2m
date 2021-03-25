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
                        label: "Teknik Informatika dan Komputer",
                        backgroundColor: "rgb(27,64,145)",
                        data: [2, 6, 6, 5]
                    },
                    {
                        label: "Teknik Mesin",
                        backgroundColor: "rgb(52,157,204)",
                        data: [4, 5, 6, 11]
                    },
                    {
                        label: "Teknik Sipil",
                        backgroundColor: "rgb(151,98,44)",
                        data: [5, 5, 6, 7]
                    },
                    {
                        label: "Teknik Elektro",
                        backgroundColor: "rgb(242,113,9)",
                        data: [7, 6, 8, 9]
                    },
                    {
                        label: "Teknik Grafika dan Penerbitan",
                        backgroundColor: "rgb(206,203,48)",
                        data: [8, 5, 5, 5]
                    },
                    {
                        label: "Administrasi dan Niaga",
                        backgroundColor: "rgb(0,135,151)",
                        data: [8, 4, 4, 6]
                    },
                    {
                        label: "Akutansi",
                        backgroundColor: "rgb(204,57,55)",
                        data: [4, 7, 5, 13]
                    },
                    {
                        label: "MTTE",
                        backgroundColor: "rgb(97,177,90)",
                        data: [2, 1, 7, 1]
                    },
                    {
                        label: "P3M",
                        backgroundColor: "rgb(132,94,194)",
                        data: [2, 4, 2, 5]
                    },
                    {
                        label: "MP-WMBK",
                        backgroundColor: "rgb(255,206,137)",
                        data: [5, 3, 6, 1]
                    }
                ]
            },
            {
                responsive: true,
                maintainAspectRatio: false,
                title: {
                    display: true,
                    text: "Data Pelaksanaan Pengabdian Internal Per Skim"
                },
                legend: {
                    position: "right"
                }
            }
        );
    }
};
</script>
