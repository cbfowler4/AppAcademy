function Student (fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
}

function Course (name, dept, num_creds, days, time_block) {
  this.name = name;
  this.dept = dept;
  this.num_creds = num_creds;
  this.students = [];
  this.days = days;
  this.time_block = time_block;
}

Student.prototype.name = function () {
  return `${this.lname}, ${this.fname}`;
};

Student.prototype.enroll = function (course) {
  
  if (this.hasConflict(course)) {
    throw "There is a conflict.";
  }
  
  this.courses.push(course);
  if (course.students.includes(this) === false) {
    course.students.push(this);
  }
};

Student.prototype.hasConflict = function (course) {
  var conflict = false;
  this.courses.forEach( (current_course) => {
    if (current_course.conflicts_with(course)) {
      conflict = true;
    }
  });
  return conflict;
};

Student.prototype.courseLoad = function () {
  const course_load = {};
  
  this.courses.forEach( (el) => {
    if (course_load[el.dept] == undefined) {
      course_load[el.dept] = el.num_creds;
    } else {
      course_load[el.dept] += el.num_creds;
    }
  });
  return course_load;
};

Course.prototype.addStudent = function (student) {
  student.enroll(this);
};

Course.prototype.conflicts_with = function (course) {
  var conflict = false;
  if (this.time_block === course.time_block) {
    course.days.forEach((day) => {
      if (this.days.includes(day)) {
        conflict = true;
      }
    });
  }
  return conflict;
};

const spongebob = new Student('Spongebob', 'Squarepants');
const patrick = new Student('Patrick', 'Star');

const driving = new Course('Driving 101', 'Ms.Puff Boating School', 3, ['m', 'w', 'f'], 7);
const crashing = new Course('Crash Safety 101', 'Ms.Puff Boating School', 4, ['m', 'w', 'f'], 4);
const sleeping = new Course('Sleeping 101', 'Gary Sleep School', 3, ['t', 'th', 'f'], 7);


driving.addStudent(spongebob);
driving.addStudent(patrick);
// 
// crashing.addStudent(spongebob);
// 
// sleeping.addStudent(patrick);
// sleeping.addStudent(spongebob);



