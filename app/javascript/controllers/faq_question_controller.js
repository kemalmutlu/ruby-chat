import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [];

    connect() {
        let faq_questions = document.getElementsByClassName('append-question');
        const results_div = document.getElementById('results')

        Array.from(faq_questions).forEach((question) => {
            question.addEventListener('click', function () {
                const url = this.dataset.url;
                fetch(`${url}`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                })
                    .then(response => response.json())
                    .then(data => {
                        const newContent = `
                          <div id="${data.id}" class="my-[20px] min-w-full border border-gray-300 text-gray-900 bg-gray-600 rounded-lg">
                            <div class="flex flex-row justify-end text-right">
                              <span class="max-w-[75%] px-2 py-2">
                                ${data.question}
                              </span>
                            </div>
                            <div class="flex flex-row justify-start text-left">
                              <span class="max-w-[75%] px-2 py-2">
                                ${data.answer}
                              </span>
                            </div>
                          </div>
                        `;
                        results_div.insertAdjacentHTML('beforeend', newContent);
                    })
                    .catch(error => {
                        console.error('AJAX Error:', error);
                    });
            });
        });
    }
}
