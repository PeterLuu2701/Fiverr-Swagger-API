import { ApiProperty } from "@nestjs/swagger";

export class CreateJobTypeDto {
    @ApiProperty()
    job_type_name: string
}
