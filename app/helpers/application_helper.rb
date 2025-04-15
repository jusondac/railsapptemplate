module ApplicationHelper
    include Pagy::Frontend
    def render_columns(data, columns)
        columns.map do |column|
            content_tag :td, class: "p-4 text-sm font-normal text-gray-500 whitespace-nowrap dark:text-gray-400" do
                content_tag :div, class: column[:bold] ? "text-base font-semibold text-gray-900 dark:text-white" : "" do
                    data.send(column[:field])
                    content_tag :button, class: "ml-2 text-blue-600 hover:underline dark:text-blue-400", onclick: "navigator.clipboard.writeText('#{data.send(column[:field])}')" do
                        content_tag :svg, class: "w-4 h-4", fill: "none", viewBox: "0 0 24 24", stroke: "currentColor" do
                            content_tag :path, d: "M16.5 3h-9a2.5 2.5 0 00-2.5 2.5v15A2.5 2.5 0 007.5 21h9a2.5 2.5 0 002.5-2.5V5A2.5 2.5 0 0016.5 3z", strokeLinecap: "round", strokeLinejoin: "round", strokeWidth: "1.5"
                        end
                    end
                end
            end
        end.join.html_safe
    end
end
