import { ApiProperty } from "@nestjs/swagger";

export class CreateJobTypeDetailListDto {
    @ApiProperty()
    detail_name: string
}