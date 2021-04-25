<script>
import { Line } from "vue-chartjs";

export default {
    extends: Line,
    mounted() {
        this.renderChart(
            {
                labels: ["2017", "2018", "2019", "2020", "2021"],
                datasets: [
                    {
                        label: "Teknik Informatika dan Komputer",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(27,64,145)",
                        borderColor: "rgb(27,64,145)",
                        data: [0, 6, 6, 5]
                    },
                    {
                        label: "Teknik Mesin",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(52,157,204)",
                        borderColor: "rgb(52,157,204)",
                        data: [0, 5, 6, 11]
                    },
                    {
                        label: "Teknik Sipil",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(151,98,44)",
                        borderColor: "rgb(151,98,44)",
                        data: [0, 5, 6, 7]
                    },
                    {
                        label: "Teknik Elektro",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(242,113,9)",
                        borderColor: "rgb(242,113,9)",
                        data: [0, 6, 8, 9]
                    },
                    {
                        label: "Teknik Grafika dan Penerbitan",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(206,203,48)",
                        borderColor: "rgb(206,203,48)",
                        data: [0, 5, 5, 5]
                    },
                    {
                        label: "Administrasi dan Niaga",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(0,135,151)",
                        borderColor: "rgb(0,135,151)",
                        data: [0, 4, 4, 6]
                    },
                    {
                        label: "Akutansi",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(204,57,55)",
                        borderColor: "rgb(204,57,55)",
                        data: [0, 7, 5, 13]
                    },
                    {
                        label: "MTTE",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(97,177,90)",
                        borderColor: "rgb(97,177,90)",
                        data: [0, 1, 0, 1]
                    },
                    {
                        label: "P3M",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(132,94,194)",
                        borderColor: "rgb(132,94,194)",
                        data: [0, 4, 2, 0]
                    },
                    {
                        label: "MP-WMBK",
                        backgroundColor: "transparent",
                        pointBackgroundColor: "rgb(255,206,137)",
                        borderColor: "rgb(255,206,137)",
                        data: [0, 0, 0, 1]
                    }
                ]
            },
            {
                responsive: true,
                maintainAspectRatio: false,
                title: {
                    display: true,
                    text: "Data Pengabdian Internal Per Jurusan",
                    fontSize: 14
                },
                legend: {
                    position: "bottom",
                    labels: {
                        // fontFamily : 'Poppins',
                        usePointStyle: true,
                    }
                },
                elements: {
                    point: {
                        pointStyle: "rectRot",
                        radius: "7"
                    },
                    line: {
                        borderWidth: "2"
                    }
                }
            }
        );
    }
};
</script>
