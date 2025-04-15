// I call the apexcharts on name on importmaps
import ApexCharts from "apexcharts"

document.addEventListener("turbo:load", () => {
    const el = document.querySelector("#chart")
    if (!el) return

    let labels = []
    let values = []

    try {
        labels = JSON.parse(el.dataset.salesLabels || "[]")
        values = JSON.parse(el.dataset.salesValues || "[]")
    } catch (e) {
        console.error("Failed to parse chart data", e)
    }

    const options = {
        chart: {
            type: 'area',
            height: 600,
            background: 'transparent' // ← make background fully transparent
        },
        theme: {
            mode: 'dark' // keep this for dark mode
        },
        xaxis: {
            categories: labels,
            labels: {
                style: {
                    colors: '#ccc', // ← x-axis label color
                    fontSize: '12px'
                }
            }
        },
        yaxis: {
            labels: {
                style: {
                    colors: '#ccc', // ← y-axis label color
                    fontSize: '12px'
                }
            }
        },
        dataLabels: {
            enabled: false,
            style: {
                colors: ['#2d3748'] // ← color of the number labels on each point
            }
        },
        tooltip: {
            theme: 'dark' // makes tooltips match dark mode
        },
        series: [{
            name: 'Monthly Sales',
            data: values
        }]
    }


    const chart = new ApexCharts(el, options)
    chart.render()
})
