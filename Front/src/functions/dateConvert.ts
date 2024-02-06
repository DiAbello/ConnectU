export default function convertDate(date: string) {
    const months = [
        'янв',
        'фев',
        'мар',
        'апр',
        'мая',
        'июн',
        'июл',
        'авг',
        'сен',
        'окт',
        'нояб',
        'дек'
      ];
    const dateParts = date.split(' ')
    const dateComponents = dateParts[0].split('-')
    const day = parseInt(dateComponents[2], 10);
    const monthIndex = parseInt(dateComponents[1], 10) - 1;
    const month = months[monthIndex];
    const year = parseInt(dateComponents[0], 10);
    const time = dateParts[1].split(':').slice(0, 2).join(':');
    return day + ' '  + month + ' ' + year + ' ' + time
}